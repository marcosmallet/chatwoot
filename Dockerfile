FROM ruby:3.1-slim

# Instala dependências do sistema
RUN apt-get update && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  yarn \
  git \
  curl \
  && apt-get clean

# Diretório de trabalho
WORKDIR /app

# Copia os arquivos do projeto
COPY . .

# Instala as gems
RUN bundle install

# Pré-compila os assets (opcional para produção)
RUN RAILS_ENV=production bundle exec rake assets:precompile

# Define variáveis padrão
ENV RAILS_ENV=production \
    NODE_ENV=production \
    INSTALLATION_ENV=docker \
    DEFAULT_LOCALE=pt_BR

# Expõe a porta padrão do Rails
EXPOSE 3000

# Comando de inicialização
CMD ["bundle", "exec", "rails", "s", "-p", "3000", "-b", "0.0.0.0"]
