with
    pedidos as (
        select *
        from{{ ref('stg_erp__pedidos') }}
    )

    , pedido_item as (
        select *
        from {{ ref('stg_erp__detalhepedidos') }}
    ) 

    , uniao_tabelas as (
        select
            pedidos.id_pedido_venda
            , pedidos.id_cliente
            , pedidos.id_cobranca_endereco
            , pedidos.id_envio_ende
            --, pedidos.id_cartaocredito				
            --, pedidos.numero_pedido_compra											
            --, pedidos.numero_pedido_venda				
            , pedidos.imposto_venda				
            , pedidos.id_endereco_envio								
            , pedidos.metodo_envio				
            , pedidos.status_pedido				
            , pedidos.data_pedido									
            , pedidos.subtotal_pedido				
            , pedidos.numero_revisao_pedido				
            , pedidos.frete_pedido 			
            , pedidos.data_prrazo_pedido				
            , pedidos.total_pedido							
            , pedidos.data_envio_pedido	
            , pedido_item.id_pedido_detalhe_venda
            , pedido_item.id_produto
            , pedido_item.quantidade_pedido										
            , pedido_item.preco_unitario	 

        from pedidos
        left join pedido_item on pedidos.id_pedido_venda = pedido_item.id_pedido_venda
    )

select *
from uniao_tabelas