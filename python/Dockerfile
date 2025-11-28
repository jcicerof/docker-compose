# https://chatgpt.com/c/690ee24e-5aac-8329-942f-b6420d3f1758


# Imagem base leve
FROM alpine:3.22

# Variáveis de ambiente básicas
ENV PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1 \
    PATH=/usr/local/bin:$PATH

# Instala pacotes de sistema necessários para compilar bibliotecas científicas
RUN apk add --no-cache \
        python3 \
        py3-pip \
        python3-dev \
        build-base \
        gfortran \
        lapack-dev \
        blas-dev \
        openblas-dev \
        freetype-dev \
        libpng-dev \
        musl-dev \
        linux-headers \
        bash \
        git \
        nodejs

# Atualiza pip e instala pacotes científicos principais
RUN python3 -m pip install --upgrade pip --break-system-packages && \
    python3 -m pip install --break-system-packages \
        numpy pandas matplotlib scipy statsmodels scikit-learn seaborn sympy jupyterlab

# Diretório de trabalho padrão
WORKDIR /workspace

# Porta do Jupyter (caso queira usar)
EXPOSE 8888

# Comando padrão: shell interativo
CMD ["/bin/bash"]

