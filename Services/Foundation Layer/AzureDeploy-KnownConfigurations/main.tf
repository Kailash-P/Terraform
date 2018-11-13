
variable "resourcesize" {
  # type        = "map"
  default = {
    # Small
    Small={
      cdnSettings={
         sku= "Standard_Akamai"
      },
      cacheSettings={
         sku= "Premium",
         skuFamily="P",
         skuCapacity= 1
      }
      appServicePlanSettings_Public={
         skuName= "I1",
         skuCapacity= 1,
         needsAutoScaling= false

      }
      appServicePlanSettings_Private={
          skuName= "I1",
          skuCapacity= 1,
          needsAutoScaling= false
      }
      mysqlSettings= {            
          skuCapacityvCore= 1,
          skuName= "B_Gen4_1",
          skuTier= "Basic",
          skuSizeMB= 5120            
      }
       sqlSettings= {            
          databaseCollation= "SQL_Latin1_General_CP1_CI_AS",
          performanceLevel= "Basic"          
      }
       postgresqlSettings= {            
          skuCapacityvCore= 1,
          skuName= "B_Gen5_1",
          skuTier= "Basic",
          skuSizeMB= 5120
          skuFamily= "Gen5"       
      }
       vmSettings= {            
          sku="Standard_A4_v2"      
      }
       analysisServiceSetting= {            
          sku="D1"      
      }
       sqlDataWarehouseSetting= {            
          performanceLevel= "DW1000"      
      }
       hdInsightSettings= {            
         clusterVersion= "3.6",
         clusterHeadNodeSize= "Standard_D3_v2",
         clusterWorkerNodeSize= "Standard_D3_v2",
         clusterKind= "SPARK"      
      }
      datahubMetaStoreSettings= {            
         performanceDTU= "S1",
          performanceLevel= "Standard"    
      }
      kubernetesClusterSettings={
           clusterWorkerNodeSize="Standard_A4_v2" 
           nodecount=1
         }
        appserviceSettings={
             skuTier="Free",
             skuSize="F1"
         } 
         storageaccountsettings={
          account_tier="Standard"
          account_replication_type="GRS"
      }
    }
     #Large
    Large={
      cdnSettings={
         sku= "Premium_Verizon"
      },
      cacheSettings={
         sku= "Premium",
         skuFamily="P",
         skuCapacity= 3
      }
      appServicePlanSettings_Public={
        skuName="P1",
        skuCapacity= 2,
        needsAutoScaling= true

      }
      appServicePlanSettings_Private={
          skuName= "I3",
          skuCapacity= 4,
          needsAutoScaling= true
      }
      mysqlSettings= {            
          skuCapacityvCore= 2,
          skuName= "GP_Gen5_2",
          skuTier= "GeneralPurpose",
          skuSizeMB= 100000          
      }
       sqlSettings= {            
          databaseCollation= "SQL_Latin1_General_CP1_CI_AS",
          performanceLevel= "Basic"         
      }
       postgresqlSettings= {            
          skuCapacityvCore= 2,
          skuName= "GP_Gen5_2",
          skuTier="GeneralPurpose",
          skuSizeMB= 100000    
          skuFamily= "Gen5"     
      }
       vmSettings= {            
          sku="Standard_B2ms"      
      }
       analysisServiceSetting= {            
          sku="D1"      
      }
       sqlDataWarehouseSetting= {            
          performanceLevel= "DW1000"      
      }
       hdInsightSettings= {            
         clusterVersion= "3.6",
         clusterHeadNodeSize= "Standard_D3_v2",
         clusterWorkerNodeSize= "Standard_D3_v2",
         clusterKind= "SPARK"     
      }
      datahubMetaStoreSettings= {            
         performanceDTU= "S1",
          performanceLevel= "Standard"    
      }
      kubernetesClusterSettings={
           clusterWorkerNodeSize="Standard_D2_v2" 
           nodecount=3
      }
      storageaccountsettings={
          account_tier="Premium"
          account_replication_type="LRS"
      }
         
         appserviceSettings={
             skuTier="Standard",
             skuSize="S1"
         }


    }

    # Medium

     Medium={
      cdnSettings={
         sku= "Standard_Verizon"
      },
      cacheSettings={
         sku= "Premium",
         skuFamily="P",
         skuCapacity= 2
      }
      appServicePlanSettings_Public={
         skuName= "S1",
         skuCapacity= 2,
         needsAutoScaling= true

      }
      appServicePlanSettings_Private={
          skuName= "I1",
          skuCapacity= 1,
          needsAutoScaling= false
      }
      mysqlSettings= {            
          skuCapacityvCore= 2,
          skuName= "B_Gen4_2",
          skuTier="Basic",
          skuSizeMB= 25000       
      }
       sqlSettings= {            
          databaseCollation= "SQL_Latin1_General_CP1_CI_AS",
          performanceLevel= "Basic"         
      }
       postgresqlSettings= {            
          skuCapacityvCore= 2,
          skuName= "GP_Gen5_2",
          skuTier= "GeneralPurpose",
          skuSizeMB= 25000  
          skuFamily="Gen5"   
      }
       vmSettings= {            
          sku="Standard_B2ms"      
      }
       analysisServiceSetting= {            
          sku="D1"      
      }
       sqlDataWarehouseSetting= {            
          performanceLevel= "DW1000"      
      }
       hdInsightSettings= {            
         clusterVersion= "3.6",
         clusterHeadNodeSize= "Standard_D3_v2",
         clusterWorkerNodeSize= "Standard_D3_v2",
         clusterKind= "SPARK"      
      }
      datahubMetaStoreSettings= {            
         performanceDTU= "S1",
          performanceLevel= "Standard"    
      }
       kubernetesClusterSettings={
           clusterWorkerNodeSize="Standard_B2ms" 
           nodecount=2
         }
   appserviceSettings={
             skuTier="Basic",
             skuSize="B1"
         }
         storageaccountsettings={
          account_tier="Standard"
          account_replication_type="GRS"
      }
    }
  }
}
output "ConfigurationsValue" {
  # value="${var.deplomentsize=="small"? var.smallvalues:var.deplomentsize=="large"? var.largevalues:var.meadiumsize}"
  value="${var.resourcesize[var.deplomentsize]}"
}


variable "deplomentsize" {  
 default="Small"
}
