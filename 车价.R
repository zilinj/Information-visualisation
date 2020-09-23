library(ggplot2)
library(dplyr)
library(hrbrthemes)


# The dataset used in this assignment is form https://www.kaggle.com/gunishj/carpricepred

# Load dataset 
data <- read.csv(file.choose(),header=T)

data %>% select(c(-1))->data

#Rplot 1 car selling price with regard to car doors and fuel Type
ggplot(data=data,aes(x=factor(Doors),y=SellingPrice,fill=Fuel_Type))+geom_boxplot()->m1
m1+labs(title = "Car Selling Price with regard to Doors & Fuel Type", x="Doors",y="Selling Price($)",fill="Fuel Type")->m2
m2+theme(legend.spacing= unit(0.2, "cm"), legend.key = element_rect(fill = "grey90",colour = "white"),legend.title = element_text(size = rel(0.8),face = "bold", hjust = 0))->m3
m3+theme(panel.background = element_rect(fill = "grey90", colour ="black"),plot.title = element_text(hjust = 0.5,face="bold",colour="black"),plot.margin = unit(c(1, 1, 1, 3), "lines"))

#Rplot 2 car selling price with regard to car Age and fuel Type
ggplot(data=data,aes(x=Age,y=SellingPrice,col=Fuel_Type))+geom_point()+geom_smooth(method="lm",se=F)+facet_grid(~Fuel_Type)->n1
n1+labs(title = "Car Selling Price with regard to Age & Fuel Type", x="Age",y="Selling Price($)",fill="Fuel Type")->n2
n2+theme(legend.key = element_rect(fill = "grey90",colour = "white"),legend.title = element_text(size = rel(0.8),face = "bold", hjust = 0),)->n3
n3+theme(panel.background = element_rect(fill = "grey90", colour ="black"),legend.spacing= unit(0.2, "cm"),plot.title = element_text(hjust = 0.5,face="bold",colour="black"),plot.margin = unit(c(1, 1, 1, 3), "lines"))