namespace :dev do

  DEFAULT_PASSWORD = 123456

  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando BD...") { %x(rails db:drop) }
      show_spinner("Criando BD...") { %x(rails db:create) }
      show_spinner("Migrando BD...") { %x(rails db:migrate) }
      show_spinner("Cadastrando o administrador padrão") { %x(rails dev:add_default_admin) }
      show_spinner("Cadastrando o usuário padrão") { %x(rails dev:add_default_user) }
      # %x(rails dev:add_admins)
    else
      puts "Você não está no ambiente de desenvolvimento"
    end
  end

  desc "Adiciona o adminstrador padrão"
  task add_default_admin: :environment do
    Admin.create!(
      email: 'everson.admin@gmail.com',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
  end

  desc "Adiciona o usuário padrão"
  task add_default_user: :environment do
    User.create!(
      email: 'everson.user@gmail.com',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD,
    )
  end

  private

  def show_spinner(loading_message, resolve_message = "Concluído")
    spinner = TTY::Spinner.new("[:spinner]) #{loading_message}")
    spinner.auto_spin
    yield
    spinner.success("#{resolve_message}")
  end

end
