FROM golang:bullseye

ARG poetry_version=1.3.2

RUN apt-get update && apt-get -y install make build-essential libssl-dev zlib1g-dev libbz2-dev libev-dev \
    libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
    xz-utils tk-dev libffi-dev liblzma-dev python3-openssl git gcc jq zsh bat exa vim \
    python3-pip python3-dev nodejs

RUN curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash && \
    curl -sSL https://install.python-poetry.org | POETRY_HOME=/etc/poetry python3 - --version ${poetry_version}

WORKDIR /src
ENV PATH="${PATH}:/etc/poetry/bin"
CMD ["bash"]