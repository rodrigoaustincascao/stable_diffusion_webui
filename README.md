# Stable Diffusion Webui

Projeto visa executar localmente o Stable Diffusion utilizando Docker e Devcontainer. Stable Diffusion é um modelo de deep learning de texto para imagem  com base em técnicas de difusão.


## Execução

### Requisitos
- Docker
- Docker Compose
- VSCode
- Extensões do VSCode:
    - DevContainer => `ms-vscode-remote.remote-containers`
    - Docker => `ms-azuretools.vscode-docker`

### Execução
Abrir o projeto no VSCode e selecionar a opção `Open a Remote Window`     


## Em caso de erro
- ImportError: libGL.so.1: cannot open shared object file: No such file or directory

```
sudo apt-get install ffmpeg libsm6 libxext6  -y

```

- AttributeError: 'NoneType' object has no attribute 'lowvram'
```
./webui.sh --lowvram --precision full --no-half --skip-torch-cuda-test

```

- RuntimeError: Torch is not able to use GPU; add --skip-torch-cuda-test to COMMANDLINE_ARGS variable to disable this check
```
pip install pydantic==2.0 
pip install --upgrade --force-reinstall fastapi   
pip install --upgrade --force-reinstall websockets==11.0
pip install --upgrade --force-reinstall torch torchvision torchaudio
sudo apt-get install ffmpeg libsm6 libxext6  -y 


./webui.sh --skip-torch-cuda-test 
```
