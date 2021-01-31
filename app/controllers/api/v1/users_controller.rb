module Api
	module V1
		class UsersController < ApplicationController
      			
			# Listar todos os usuários
			def index
				users = User.order('name ASC');
				render json: {status: 'SUCCESS', message:'Usuários carregados', data:users},status: :ok
			end

			# Listar usuário passando ID
			def show
				users = User.find(params[:id])
				render json: {status: 'SUCCESS', message:'Loaded article', data:users},status: :ok
			end

			# Criar um novo usuário
			def create
				@users = User.new(params.permit(:name))
				if @users.save
					render json: {status: 'SUCCESS', message:'Saved user', data:@users},status: :ok
				else
					render json: {status: 'ERROR', message:'User not saved', data:@users.errors},status: :unprocessable_entity
				end
			end

			# Excluir users
			def destroy
				users = User.find(params[:id])
				users.destroy
				render json: {status: 'SUCCESS', message:'Deleted users', data:users},status: :ok
			end

			# Atualizar um users
			def update
				users = User.find(params[:id])
				if users.update(user_params)
					render json: {status: 'SUCCESS', message:'Updated users', data:users},status: :ok
				else
					render json: {status: 'ERROR', message:'Users not update', data:users.erros},status: :unprocessable_entity
				end
			end

			private
			def user_params
				params.permit(:name)
			end
		end
	end
end