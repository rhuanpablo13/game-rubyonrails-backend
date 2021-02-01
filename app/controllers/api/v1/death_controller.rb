module Api
	module V1
		class DeathController < ApplicationController
      			
			# Listar todos as deaths
			def index
				death = Death.all;
				render json: {status: 'SUCCESS', message:'Deaths loaded', data:death},status: :ok
			end

			# Listar death passando ID
			def show
				death = Death.find(params[:id])
				render json: {status: 'SUCCESS', message:'Loaded deaths', data:death},status: :ok
			end

			# Criar um novo death
			def create
				@death = Death.new(params.permit(:name))
				if @death.save
					render json: {status: 'SUCCESS', message:'Saved death', data:@death},status: :ok
				else
					render json: {status: 'ERROR', message:'Death not saved', data:@death.errors},status: :unprocessable_entity
				end
			end

			# Excluir death
			def destroy
				death = Death.find(params[:id])
				death.destroy
				render json: {status: 'SUCCESS', message:'Deleted death', data:death},status: :ok
			end

			# Atualizar um death
			def update
				death = Death.find(params[:id])
				if death.update(death_params)
					render json: {status: 'SUCCESS', message:'Updated death', data:death},status: :ok
				else
					render json: {status: 'ERROR', message:'Deaths not update', data:death.erros},status: :unprocessable_entity
				end
			end

			private
			def death_params
				params.permit(:user_id, :time_reg)
			end
		end
	end
end