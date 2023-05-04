Input =("
")

Matrix = as.matrix(read.table(textConnection(Input),
                              header=TRUE,
                              row.names=1))
names(dimnames(Matrix))[1] = "ID"
names(dimnames(Matrix))[2] = "Values"
library(reshape2)

Data = melt(Matrix)
library(psych)

headTail(Data)
library(RVAideMemoire)

cochran.qtest(value ~ Symptom | LabID,
              data = Data)

library(coin)

symmetry_test(value ~ Symptom| LabID,
              data = Data,
              teststat = "quad")
