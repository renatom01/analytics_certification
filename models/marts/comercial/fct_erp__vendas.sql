with
    pedidos as (
        select *
        from{{ ref('int_vendas__pedido_itens') }}
    )

    , clientes as (
        select *
        from {{ ref('dim_erp__clientes') }}
    ) 

    , produtos as (
        select *
        from {{ ref('dim_erp__produtos') }}
    ) 

    , cartao as (
        select *
        from {{ ref('dim_erp__cartao') }}
    )

     
    , uniao_tabelas as (
        select
            pedidos.id_pedido_venda
            , pedidos.id_cliente
            --, pedidos.id_cartaocredito
            , pedidos.id_cobranca_endereco
            , pedidos.id_envio_ende
            , pedidos.id_pedido_detalhe_venda
            , pedidos.id_produto
            , pedidos.id_endereco_envio				
            --, pedidos.numero_pedido_compra											
            --, pedidos.numero_pedido_venda				
            , pedidos.imposto_venda												
            --, pedidos.metodo_envio				
            , pedidos.status_pedido				
            , pedidos.data_pedido									
            , pedidos.subtotal_pedido				
            , pedidos.numero_revisao_pedido				
            , pedidos.frete_pedido 			
            , pedidos.data_prrazo_pedido				
            , pedidos.total_pedido							
            , pedidos.data_envio_pedido	 
            , pedidos.quantidade_pedido										
            , pedidos.preco_unitario

            , clientes.id_endereco           		
            , clientes.ultimo_nome_cliente
            , clientes.primeiro_nome_cliente				
            --, clientes.meio_nome_cliente								
            , clientes.nome_empresa_cliente
            , clientes.tipo_endereco           	
            , clientes.cidade
            , clientes.cep
            , clientes.detalhe_endereco			
            , clientes.pais				
            , clientes.estado 

            , produtos.id_produto_categoria
            , produtos.id_produto_modelo
            --, produtos.id_linha_produto			
            --, produtos.data_final_venda_produto
            , produtos.numero_produto										
            , produtos.custo_padrao_produto		
            , produtos.nome_produto		
            , produtos.preco_listado_produto
            , produtos.data_inical_venda_produto	          
            
            --, cartao.tipo_cartao
            	 

        from pedidos
        left join clientes on pedidos.id_cliente = clientes.id_cliente
        left join produtos on pedidos.id_produto = produtos.id_produto
        --inner join cartao on pedidos.id_cartaocredito = cartao.id_cartaocredito
    )

select *
from uniao_tabelas