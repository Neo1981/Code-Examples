
##Created by: Nadeem Ramjan
##Created on: February 26, 2016
##This program will map member's to their Servicing Provider

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
Claims <- sqlQuery(odbcChannel,"SELECT

                   [Claim_Number]
                   ,hfmc.latitude
                   ,hfmc.longitude
                   ,hfpc.latitude
                   ,hfpc.longitude
                   FROM NSLIJHS_RCR_Warehouse.HealthFirst.vw_Medical_Claims c
                   inner join NSLIJHS_RCR_Analysis.HealthFirst.HF_Provider_Geocoded hfpc on hfpc.Servicing_Provider_ID=c.Servicing_Provider_ID
                   inner join NSLIJHS_RCR_Analysis.HealthFirst.HF_Member_Geocoded hfmc on hfmc.Member_Number=c.Member_Number
                   where c.Service_Start_Date between '2014-9-1' and '2015-10-31'
                   group by [Claim_Number]
                   ,hfmc.latitude
                   ,hfmc.longitude
                   ,hfpc.latitude
                   ,hfpc.longitude 
                   order by Claim_Number 
                   ")


ClaimsDF <- data.frame(ClaimNumber=character(),Distance=integer(), stringsAsFactors = FALSE)

for (i in 1:nrow(Claims)) {
  
  
      miles <- (earth.dist(Claims[i,3],Claims[i,2],Claims[i,5],Claims[i,4]))
      
      ClaimsDF[i,1]  <- Claims[i,1]
      ClaimsDF[i,2]  <- miles
      
      miles <- NULL
      
      print (i)
}
      



#distm (c(lat1, lon1), c(lat2, lon2), fun = distHaversine)


odbcClose(odbcChannel)

#ResultsDF

write.csv(ClaimsDF, file="ResultsClaimsMappingV2.csv")

#Code to write to DB
#library(RODBC)
#odbcChannel2 <- odbcDriverConnect("driver=SQL Server; server=CYKPCISADBSQL; database=NSLIJHS_RCR_Analysis")
#sqlSave(odbcChannel2,ClaimsDF,tablename = 'HealthFirst.HF_Member_ClaimsMapping',rownames = F)
#odbcClose(odbcChannel)




