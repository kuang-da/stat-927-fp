# ----------
# Dataset 1
# ----------
data_mat <- t(as.matrix(Matrix::readMM('svensson1.mtx')))
colsum_vec <- colSums(data_mat)
hist(log(rowSums(data_mat)))

col_idx <- runif(100, min=1, max=2000)
data_mat <- data_mat[, col_idx]

sum(rowSums(data_mat) > 150)

row_idx <- rowSums(data_mat) > 150
print(paste0("bin 1: ", sum(row_idx)))
write.csv(data_mat[row_idx, ], "svensson1-1.csv")

row_idx <- rowSums(data_mat) < 150 & rowSums(data_mat) > 100
print(paste0("bin 2: ", sum(row_idx)))
write.csv(data_mat[row_idx, ], "svensson1-2.csv")

row_idx <- rowSums(data_mat) < 100 & rowSums(data_mat) > 50
print(paste0("bin 3: ", sum(row_idx)))
write.csv(data_mat[row_idx, ], "svensson1-3.csv")

row_idx <- rowSums(data_mat) < 50 & rowSums(data_mat) > 0
print(paste0("bin 4: ", sum(row_idx)))
write.csv(data_mat[row_idx, ], "svensson1-4.csv")

# ----------
# Dataset 2
# ----------
# install.packages('Seurat')
library(Seurat)
data_obj <- Read10X("data/filtered_feature_bc_matrix")
dim(data_obj)
data_obj <- data_obj[,colSums(data_obj) > 2000]
dim(data_obj)
idx_hg <- startsWith(rownames(data_obj), "hg19")
idx_mm <- startsWith(rownames(data_obj), "mm10")
sum_hg <- colSums(data_obj[idx_hg,])
sum_mm <- colSums(data_obj[idx_mm,])

ratio_vec <- sum_hg/sum_mm

HEK293T_obj <- data_obj[idx_hg, ratio_vec > 20]
dim(HEK293T_obj)

col_idx <- as.integer(runif(100, min=1, max=2380))
HEK293T_obj <- HEK293T_obj[, col_idx]
dim(HEK293T_obj)

row_idx <- rowSums(HEK293T_obj) > 150
print(paste0("bin 1: ", sum(row_idx)))
write.csv(HEK293T_obj[row_idx, ], "data/HEK293T-1.csv")

row_idx <- rowSums(HEK293T_obj) < 150 & rowSums(HEK293T_obj) > 100
print(paste0("bin 2: ", sum(row_idx)))
write.csv(HEK293T_obj[row_idx, ], "data/HEK293T-2.csv")

row_idx <- rowSums(HEK293T_obj) < 100 & rowSums(HEK293T_obj) > 50
print(paste0("bin 3: ", sum(row_idx)))
write.csv(HEK293T_obj[row_idx, ], "data/HEK293T-3.csv")

row_idx <- rowSums(HEK293T_obj) < 50 & rowSums(HEK293T_obj) > 0
print(paste0("bin 4: ", sum(row_idx)))
write.csv(HEK293T_obj[row_idx, ], "data/HEK293T-4.csv")
