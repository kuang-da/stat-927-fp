library(rstanarm)
library(bayesrules)
library(parallel)
# install.packages("rstanarm")
# install.packages("bayesrules")

fit_nb <- function(y, m_vec, family_str){
  data_df <- data.frame(y=as.numeric(y), m=log10(m_vec))
  glm_obj <- stan_glm(y ~ m,
                      data = data_df, 
                      # family = "neg_binomial_2", "poisson"
                      family = family_str, 
                      prior = NULL,
                      seed = 12345,
                      refresh = 0)
  prediction_summary(glm_obj, data_df)
}

# data_mat <- read.csv("HEK293T-1.csv", row.names=1)
# m_vec <- colSums(data_mat)
# fit_nb(data_mat[1,], m_vec, "neg_binomial_2")
bay_nb <- function(file_name, family_str){
  data_mat <- read.csv(file_name, row.names=1)
  m_vec <- colSums(data_mat)
  loopfun <- function(i){
    fit_nb(data_mat[i,], m_vec, family_str)
  }
  # res_list <- apply(data_mat, 1, fit_nb, m_vec) 
  rm_res_list <- mclapply(1:nrow(data_mat), loopfun, mc.cores=14)
  
  mae_vec <- c()
  mae_scaled_vec <- c()
  within_50_vec <- c()
  within_95_vec <- c()
  for (idx in (seq_along(rm_res_list))){
    if (length(rm_res_list[[idx]]) == 4){
      mae_vec <- c(mae_vec, rm_res_list[[idx]][[1]])
      mae_scaled_vec <- c(mae_scaled_vec, rm_res_list[[idx]][[2]])
      within_50_vec <- c(within_50_vec, rm_res_list[[idx]][[3]])
      within_95_vec <- c(within_95_vec, rm_res_list[[idx]][[4]])
    }
  }
  data.frame(mac=mae_vec,
             mae_scaled=mae_scaled_vec,
             within_50=within_50_vec,
             within_95=within_95_vec)
}

# ----------
# Dataset 1: svensson1
# ----------
file_vec <- c("data/svensson1-1.csv", "data/svensson1-2.csv",
              "data/svensson1-3.csv", "data/svensson1-4.csv")

res_1 <- bay_nb(file_vec[1], "neg_binomial_2")
res_2 <- bay_nb(file_vec[2], "neg_binomial_2")
res_3 <- bay_nb(file_vec[3], "neg_binomial_2")
write.csv(res_1, "out/svensson1-1-res.csv")
write.csv(res_2, "out/svensson1-2-res.csv")
write.csv(res_3, "out/svensson1-3-res.csv")

res_1 <- bay_nb(file_vec[1], "poisson")
res_2 <- bay_nb(file_vec[2], "poisson")
res_3 <- bay_nb(file_vec[3], "poisson")
write.csv(res_1, "out/svensson1-1-res-pois.csv")
write.csv(res_2, "out/svensson1-2-res-pois.csv")
write.csv(res_3, "out/svensson1-3-res-pois.csv")

# ----------
# Dataset 2: Single HEK293 cells
# ----------
file_vec <- c("data/HEK293T-1.csv", "data/HEK293T-2.csv",
              "data/HEK293T-3.csv", "data/HEK293T-4.csv")

res_1 <- bay_nb(file_vec[1], "neg_binomial_2")
res_2 <- bay_nb(file_vec[2], "neg_binomial_2")
res_3 <- bay_nb(file_vec[3], "neg_binomial_2")
write.csv(res_1, "out/HEK293T-1-res.csv")
write.csv(res_2, "out/HEK293T-2-res.csv")
write.csv(res_3, "out/HEK293T-3-res.csv")

res_1 <- bay_nb(file_vec[1], "poisson")
res_2 <- bay_nb(file_vec[2], "poisson")
res_3 <- bay_nb(file_vec[3], "poisson")
write.csv(res_1, "out/HEK293T-1-res-pois.csv")
write.csv(res_2, "out/HEK293T-2-res-pois.csv")
write.csv(res_3, "out/HEK293T-3-res-pois.csv")
