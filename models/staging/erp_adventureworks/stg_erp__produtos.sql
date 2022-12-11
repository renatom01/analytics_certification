with
    public_product as (
        select
            --cast(thumbnailphotofilename as string) as photo_name
            cast(productid as int) as id_produto
            , cast(productcategoryid as int) as id_produto_categoria
            , cast(productmodelid as int) as id_produto_modelo
            , cast(rowguid as string) as id_linha_produto			
            , cast(sellenddate as timestamp) as data_final_venda_produto
            , cast(productnumber as string) as numero_produto			
            --, cast(modifieddate as timestamp)							
            , cast(standardcost	as numeric) as custo_padrao_produto		
            , cast(name	as string) as nome_produto		
            --, cast(_sdc_table_version)					
            --, cast(_sdc_received_at)			
            --, cast(_sdc_sequence)			
            , cast(listprice as numeric) as preco_listado_produto
            --, cast(size)		
            --, cast(_sdc_batched_at)			
            --, cast(color)			
            , cast(sellstartdate as timestamp) as data_inical_venda_produto			
            --, cast(weight)

        from{{ source('erp', 'public_product')}}
    )
select *
from public_product