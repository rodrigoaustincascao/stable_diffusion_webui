# Use the official Python image from the Docker Hub
FROM python:3.10-bullseye

# Set environment variables
ENV PYTHONUNBUFFERED 1

# Create and set the working directory
WORKDIR /workspace

# Install required packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    git \
    curl \
    sudo \
    wget \
    zsh \
    gnupg


RUN apt-get update && apt-get install ffmpeg libsm6 libxext6  -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create a non-root user
ARG USERNAME=developer
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && echo $USERNAME ALL=\(ALL\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Switch to the non-root user
USER $USERNAME

# Install VS Code extensions for Python development
RUN pip install --upgrade pip setuptools wheel

# Optional: install additional tools like poetry, pylint, etc.
RUN pip install poetry pylint


RUN pip install pydantic==2.0 \
    pip install --upgrade --force-reinstall fastapi   \
    pip install --upgrade --force-reinstall websockets==11.0 \
    pip install --upgrade --force-reinstall torch torchvision torchaudio


# Ensure the working directory is owned by the non-root user
RUN sudo chown -R $USERNAME:$USERNAME /workspace



# Expose the application port (if necessary)
EXPOSE 8000

CMD [ "./webui.sh --lowvram --precision full --no-half --skip-torch-cuda-test" ]