class Admins::SessionsController < Devise::SessionsController
  # Criado para redirecionar para tela de login do painel admin

  def after_sign_out_path_for(_admin)
    new_admin_session_path
  end
end
