with
    public_address as (
        select 
            cast(addressid as int) as id_endereco           	
            , cast(city	as string) as cidade
            , cast(postalcode as string) as cep
            , cast(addressline1	as string) as detalhe_endereco			
            , cast(countryregion as string) as pais				
            , cast(stateprovince as string) as estado			
            --, cast(addressline2)				
            --, cast(modifieddate)				
            --, cast(rowguid)				
            --, cast(_sdc_table_version)								
            --, cast(_sdc_received_at)				
            --, cast(_sdc_sequence)				
            --, cast(_sdc_batched_at)			
        from{{ source('erp', 'public_address')}}
    )
select *
from public_address