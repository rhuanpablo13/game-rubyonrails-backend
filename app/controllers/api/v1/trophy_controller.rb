module Api
	module V1
		class TrophyController < ApplicationController
      			
			# Listar todos os troféis
			def index
				trophys = Trophy.order('name ASC');
				render json: {status: 'SUCCESS', message:'Trophys loaded', data:trophys},status: :ok
			end

			# Listar troféu passando ID
			def show
				trophys = Trophy.find(params[:id])
				render json: {status: 'SUCCESS', message:'Loaded trophy', data:trophys},status: :ok
			end

			# Criar um novo troféu
			def create
				puts params
				@trophys = Trophy.new(params.permit(:name))
				if @trophys.save
					render json: {status: 'SUCCESS', message:'Saved trophy', data:@trophys},status: :ok
				else
					render json: {status: 'ERROR', message:'Trophy not saved', data:@trophys.errors},status: :unprocessable_entity
				end
			end

			# Excluir trophys
			def destroy
				trophys = Trophy.find(params[:id])
				trophys.destroy
				render json: {status: 'SUCCESS', message:'Deleted trophys', data:trophys},status: :ok
			end

			# Atualizar um trophys
			def update
				trophys = Trophy.find(params[:id])
				if trophys.update(trophy_params)
					render json: {status: 'SUCCESS', message:'Updated trophys', data:trophys},status: :ok
				else
					render json: {status: 'ERROR', message:'Trophys not update', data:trophys.erros},status: :unprocessable_entity
				end
			end

			private
			def trophy_params
				params.permit(:name)
			end
		end
	end
end