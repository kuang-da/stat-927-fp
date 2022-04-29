# ----------
# Dataset 1 Negative Binomial
# ----------
bin1_df <- read.csv("out/svensson1-1-res.csv", row.names=1)
bin2_df <- read.csv("out/svensson1-2-res.csv", row.names=1)
bin3_df <- read.csv("out/svensson1-3-res.csv", row.names=1)

dataset1_df_median <- rbind(apply(bin1_df, 2, median), 
                        apply(bin2_df, 2, median))
dataset1_df_median <- rbind(dataset1_df_median, apply(bin3_df, 2, median))
rownames(dataset1_df_median) <- c("bin1", "bin2", "bin3")
dataset1_df_median

dataset1_df_sd <- rbind(apply(bin1_df, 2, sd, na.rm = TRUE), 
                     apply(bin2_df, 2, sd, na.rm = TRUE))
dataset1_df_sd <- rbind(dataset1_df_sd, 
                     apply(bin3_df, 2, sd, na.rm = TRUE))
rownames(dataset1_df_sd) <- c("bin1", "bin2", "bin3")
dataset1_df_sd

# ----------
# Dataset 1 Poisson
# ----------
bin1_df <- read.csv("out/svensson1-1-res-pois.csv", row.names=1)
bin2_df <- read.csv("out/svensson1-2-res-pois.csv", row.names=1)
bin3_df <- read.csv("out/svensson1-3-res-pois.csv", row.names=1)

dataset1_df_median <- rbind(apply(bin1_df, 2, median), 
                        apply(bin2_df, 2, median))
dataset1_df_median <- rbind(dataset1_df_median, 
                            apply(bin3_df, 2, median))
rownames(dataset1_df_median) <- c("bin1", "bin2", "bin3")
dataset1_df_median

dataset1_df_sd <- rbind(apply(bin1_df, 2, sd, na.rm = TRUE), 
                        apply(bin2_df, 2, sd, na.rm = TRUE))
dataset1_df_sd <- rbind(dataset1_df_sd, 
                        apply(bin3_df, 2, sd, na.rm = TRUE))
rownames(dataset1_df_sd) <- c("bin1", "bin2", "bin3")
dataset1_df_sd

# ----------
# Dataset 2 Negative Binomial
# ----------
bin1_df <- read.csv("out/HEK293T-1-res.csv", row.names=1)
bin2_df <- read.csv("out/HEK293T-2-res.csv", row.names=1)
bin3_df <- read.csv("out/HEK293T-3-res.csv", row.names=1)

dataset2_df_median <- rbind(apply(bin1_df, 2, median, na.rm = TRUE), 
                     apply(bin2_df, 2, median, na.rm = TRUE))
dataset2_df_median <- rbind(dataset2_df_median, 
                     apply(bin3_df, 2, median, na.rm = TRUE))
rownames(dataset2_df_median) <- c("bin1", "bin2", "bin3")
dataset2_df_median

dataset2_df_sd <- rbind(apply(bin1_df, 2, sd, na.rm = TRUE), 
                     apply(bin2_df, 2, sd, na.rm = TRUE))
dataset2_df_sd <- rbind(dataset2_df_sd, 
                     apply(bin3_df, 2, sd, na.rm = TRUE))
rownames(dataset2_df_sd) <- c("bin1", "bin2", "bin3")
dataset2_df_sd

# ----------
# Dataset 2 Poisson
# ----------
bin1_df <- read.csv("out/HEK293T-1-res-pois.csv", row.names=1)
bin2_df <- read.csv("out/HEK293T-2-res-pois.csv", row.names=1)
bin3_df <- read.csv("out/HEK293T-3-res-pois.csv", row.names=1)

dataset2_df_median <- rbind(apply(bin1_df, 2, median, na.rm = TRUE), 
                            apply(bin2_df, 2, median, na.rm = TRUE))
dataset2_df_median <- rbind(dataset2_df_median, 
                            apply(bin3_df, 2, median, na.rm = TRUE))
rownames(dataset2_df_median) <- c("bin1", "bin2", "bin3")
dataset2_df_median

dataset2_df_sd <- rbind(apply(bin1_df, 2, sd, na.rm = TRUE), 
                        apply(bin2_df, 2, sd, na.rm = TRUE))
dataset2_df_sd <- rbind(dataset2_df_sd, 
                        apply(bin3_df, 2, sd, na.rm = TRUE))
rownames(dataset2_df_sd) <- c("bin1", "bin2", "bin3")
dataset2_df_sd
