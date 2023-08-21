namespace :dev do

  DEFAULT_PASSWORD = 123456
  DEFAULT_FILES_PATH = File.join(Rails.root, 'lib', 'tmp')

  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando BD...") { %x(rails db:drop) }
      show_spinner("Criando BD...") { %x(rails db:create) }
      show_spinner("Migrando BD...") { %x(rails db:migrate) }
      show_spinner("Cadastrando o administrador padrão...") { %x(rails dev:add_default_admin) }
      show_spinner("Cadastrando administradores falsos...") { %x(rails dev:add_fake_admins) }
      show_spinner("Cadastrando o usuário padrão...") { %x(rails dev:add_default_user) }

      show_spinner("Cadastrando os assuntos padrão...") { %x(rails dev:add_subjects) }
      show_spinner("Cadastrando e questões e respostas...") { %x(rails dev:add_answers_and_subjects) }
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

  desc "Adiciona o adminstradores falsos para teste"
  task add_fake_admins: :environment do
    10.times do |i|
      Admin.create!(
      email: Faker::Internet.email,
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
    end
  end

  desc "Adiciona o usuário padrão"
  task add_default_user: :environment do
    User.create!(
      email: 'everson.user@gmail.com',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD,
    )
  end

  desc "Adiciona os assuntos padrão"
    task add_subjects: :environment do
      file_name = 'subjects.txt'
      file_path = File.join(DEFAULT_FILES_PATH, file_name)

      File.open(file_path, 'r').each do |line|
        Subject.create!(description: line.strip)
      end
  end

  desc "Adiciona questões e respostas"
    task add_answers_and_subjects: :environment do
      rand(5..10).times do |i|
        Subject.all.each do |subject|
          Question.create!(
            description: "#{Faker::Lorem.paragraph} #{Faker::Lorem.question}",
            subject: subject,
          )
      end
    end
  end

  private

  def show_spinner(loading_message, resolve_message = "Concluído")
    spinner = TTY::Spinner.new("[:spinner]) #{loading_message}")
    spinner.auto_spin
    yield
    spinner.success("#{resolve_message}")
  end

end
