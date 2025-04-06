FROM nvidia/cuda:12.6.3-cudnn-devel-ubuntu24.04

RUN apt update && apt -y install locales vim less python3 python3-pip && \
    localedef -f UTF-8 -i ja_JP ja_JP.UTF-8

ENV LANG=ja_JP.UTF-8
ENV LANGUAGE=ja_JP:ja
ENV LC_ALL=ja_JP.UTF-8
ENV TZ=JST-9
ENV TERM=xterm

RUN python3 -m pip install --no-cache-dir --break-system-packages \
        black==24.3.0 \
        jupyterlab==4.4.0 \
        jupyterlab_code_formatter==3.0.2 \
        lckr-jupyterlab-variableinspector==3.2.4 \
        jupyterlab_widgets==3.0.12 \
        ipywidgets==8.1.5 \
        import-ipynb==0.2

RUN python3 -m pip install --no-cache-dir --break-system-packages \
        torch==2.5.1 torchvision==0.20.1 torchaudio==2.5.1 \
        --index-url https://download.pytorch.org/whl/cu124

RUN apt-get autoremove -y && apt-get clean && rm -rf /usr/local/src/*

WORKDIR /app
