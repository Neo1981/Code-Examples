##Created by:   Nadeem Ramjan
##Created on:   February 26, 2016
##Purpose:      This program will map member nearest INN hospital
##Precondition: 1) Members address geocoded
#               2) Top 500 Providers geocoded and flagged with Hospital and In-Network

##The earthfunction below was found on StackOverflow and validated by NR
earth.dist <- function (long1, lat1, long2, lat2)
{
  rad <- pi/180
  a1 <- lat1 * rad
  a2 <- long1 * rad
  b1 <- lat2 * rad
  b2 <- long2 * rad
  dlon <- b2 - a2
  dlat <- b1 - a1
  a <- (sin(dlat/2))^2 + cos(a1) * cos(b1) * (sin(dlon/2))^2
  c <- 2 * atan2(sqrt(a), sqrt(1 - a))
  R <- 6378.145  ##represents average radius of the earth
  d <- round(R * c * 0.621371,3)  ##modified to calcuate distance in miles
  return(d)
}

library(RODBC)
odbcChannel <- odbcConnect("RCRWarehouse")
Hospitals <- sqlQuery(odbcChannel,"SELECT *
                 FROM [NSLIJHS_RCR_Analysis].[HealthFirst].[HF_Provider_Geocoded]
                 where hospital='yes' AND Network='INN'")
Members <- sqlQuery(odbcChannel,"SELECT *
                 FROM [NSLIJHS_RCR_Analysis].[HealthFirst].[HF_Member_Geocoded]")

ResultsDF <- data.frame(MemberID=character(),ClosestHospitalID=character(),ClosestHospital=character(),Distance=integer(), stringsAsFactors = FALSE)

for (i in 1:nrow(Members)) {
  Dist2Hospital <- as.integer(99999)
  for (j in 1:nrow(Hospitals)) { 
      miles <- (earth.dist(Members[i,7],Members[i,6],Hospitals[j,8],Hospitals[j,7]))
      if (miles<Dist2Hospital) {
        Dist2Hospital <- miles
        CH <- NULL
        CH <- Hospitals[j,2]
        
        CHID <- NULL
        CHID <- Hospitals[j,1]
      }
      miles <- NULL
  }
  ResultsDF = rbind(ResultsDF, data.frame(MemberID=Members[i,1],ClosestHospitalID=toString(CHID),ClosestHospital=toString(CH),Dist2Hospital))
  print (i)
}

#distm (c(lat1, lon1), c(lat2, lon2), fun = distHaversine)


odbcClose(odbcChannel)

#ResultsDF

write.csv(ResultsDF, file="ResultsDF.csv")

##[NSLIJHS_RCR_Analysis].[HealthFirst].[HF_Member_ClosestHospitalINN]
library(RODBC)
odbcChannel2 <- odbcDriverConnect("driver=SQL Server; server=CYKPCISADBSQL; database=NSLIJHS_RCR_Analysis")
#sqlSave(odbcChannel,data.frame(ResultsDF),"NSLIJHS_RCR_Analysis.HealthFirst.HF_Member_ClosestHospitalINN",safer=FALSE,append=TRUE )
#sqlSave(odbcChannel2,ResultsDF,tablename = 'HealthFirst.HF_Member_ClosestHospitalINN',rownames = F)

odbcClose(odbcChannel)




