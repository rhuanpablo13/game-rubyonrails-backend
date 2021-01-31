module Api
	module V1
		class CollectedCoinController < ApplicationController
      			
			# Listar todos os moedas
			def index
				collectedCoin = CollectedCoin.all;
				render json: {status: 'SUCCESS', message:'Collected Coins loaded', data:collectedCoin},status: :ok
			end

			# Listar moeda passando ID
			def show
				collectedCoin = CollectedCoin.find(params[:id])
				render json: {status: 'SUCCESS', message:'Loaded Collected Coins', data:collectedCoin},status: :ok
			end

			# Criar um novo moeda
			def create
				puts params
				@collectedCoin = CollectedCoin.new(collectedCoin_params)
				if @collectedCoin.save
					render json: {status: 'SUCCESS', message:'Saved collected coin', data:@collectedCoin},status: :ok
				else
					render json: {status: 'ERROR', message:'Collected Coin not saved', data:@collectedCoin.errors},status: :unprocessable_entity
				end
			end

			# Excluir collectedCoin
			def destroy
				collectedCoin = CollectedCoin.find(params[:id])
				collectedCoin.destroy
				render json: {status: 'SUCCESS', message:'Deleted collected coin', data:collectedCoin},status: :ok
			end

			# Atualizar um collectedCoin
			def update
				collectedCoin = CollectedCoin.find(params[:id])
				if collectedCoin.update(collectedCoin_params)
					render json: {status: 'SUCCESS', message:'Updated collected coin', data:collectedCoin},status: :ok
				else
					render json: {status: 'ERROR', message:'Collected coins not update', data:collectedCoin.erros},status: :unprocessable_entity
				end
			end

			private
			def collectedCoin_params
				params.permit(:user_id, :value_coin)
			end
		end
	end
end