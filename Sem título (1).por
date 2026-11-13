
    programa {
	inclua biblioteca Matematica --> mat

	funcao inicio()
	{
		inteiro opcao = 0, quantidade = 0, totalItens = 0
		real preco = 0.0, subtotal = 0.0, totalBruto = 0.0
		real valorDesconto = 0.0, valorFinal = 0.0, falta = 0.0
		cadeia nomeProduto = ""

		
		exibirCabecalho()

		faca
		{
			escreva("\n--- MENU DO SISTEMA DE VENDAS ---\n")
			escreva("1 - Adicionar produto à venda\n")
			escreva("2 - Verificar direito a desconto (10% acima de R$ 100,00)\n")
			escreva("3 - Exibir resumo parcial da compra\n")
			escreva("4 - Finalizar compra e sair\n")
			escreva("Escolha uma opção: ")
			leia(opcao)

			escolha (opcao)
			{
				caso 1:
					escreva("\nNome do produto: ")
					leia(nomeProduto)
					escreva("Preço unitário (R$): ")
					leia(preco)
					escreva("Quantidade: ")
					leia(quantidade)

					se (preco > 0 e quantidade > 0)
					{
					
						subtotal = calcularSubtotal(preco, quantidade)
						totalBruto = totalBruto + subtotal
						totalItens = totalItens + quantidade

						escreva("Produto adicionado! Subtotal do item: R$ ", mat.arredondar(subtotal, 2), "\n")
					}
					senao
					{
						escreva("Erro: O preço e a quantidade devem ser maiores que zero.\n")
					}
					pare

				caso 2:
					
					se (verificarDesconto(totalBruto))
					{
						escreva("\nParabéns! Sua compra de R$ ", mat.arredondar(totalBruto, 2), " tem direito a 10% de desconto.\n")
					}
					senao
					{
						falta = 100.0 - totalBruto
						escreva("\nDesconto indisponível. Faltam R$ ", mat.arredondar(falta, 2), " para atingir R$ 100,00.\n")
					}
					pare

				caso 3:
					se (verificarDesconto(totalBruto))
					{
						valorDesconto = aplicarDesconto(totalBruto, 10.0)
					}
					senao
					{
						valorDesconto = 0.0
					}
					valorFinal = calcularValorFinal(totalBruto, valorDesconto)

			
					exibirResumoCompra(totalItens, totalBruto, valorDesconto, valorFinal)
					pare

				caso 4:
					se (verificarDesconto(totalBruto))
					{
						valorDesconto = aplicarDesconto(totalBruto, 10.0)
					}
					senao
					{
						valorDesconto = 0.0
					}
					valorFinal = calcularValorFinal(totalBruto, valorDesconto)

					escreva("\n=== COMPRA FINALIZADA ===")
					exibirResumoCompra(totalItens, totalBruto, valorDesconto, valorFinal)
					escreva("Obrigado pela preferência!\n")
					pare

				caso contrario:
					escreva("\nOpção inválida! Escolha uma opção entre 1 e 4.\n")
			}
		}
		enquanto (opcao != 4)
	}

	
	funcao exibirCabecalho()
	{
		escreva("=========================================\n")
		escreva("        SISTEMA DE VENDAS - LOJA         \n")
		escreva("=========================================\n")
	}

	funcao real calcularSubtotal(real preco, inteiro quantidade)
	{
		retorne preco * quantidade
	}


	funcao logico verificarDesconto(real totalBruto)
	{
		se (totalBruto >= 100.0)
		{
			retorne verdadeiro
		}
		senao
		{
			retorne falso
		}
	}

	funcao real aplicarDesconto(real totalBruto, real percentual)
	{
		retorne totalBruto * (percentual / 100.0)
	}

	funcao real calcularValorFinal(real totalBruto, real valorDesconto)
	{
		retorne totalBruto - valorDesconto
	}


	funcao exibirResumoCompra(inteiro totalItens, real totalBruto, real valorDesconto, real totalFinal)
	{
		escreva("\n-----------------------------------------\n")
		escreva("            RESUMO DA COMPRA             \n")
		escreva("-----------------------------------------\n")
		escreva("Total de itens:   ", totalItens, "\n")
		escreva("Subtotal bruto:   R$ ", mat.arredondar(totalBruto, 2), "\n")
		escreva("Desconto:         R$ ", mat.arredondar(valorDesconto, 2), "\n")
		escreva("Valor a pagar:    R$ ", mat.arredondar(totalFinal, 2), "\n")
		escreva("-----------------------------------------\n")
	}
}
  
