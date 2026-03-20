FROM debian:trixie-slim
RUN apt update -y && apt install -y curl

ARG USERNAME=user
ARG USER_UID=1000
ARG USER_GID=1000

RUN groupadd --gid $USER_GID $USERNAME && \
    useradd --uid $USER_UID --gid $USER_GID -m $USERNAME

USER $USERNAME

RUN curl -fsSL https://claude.ai/install.sh | bash
RUN echo 'export PATH="$HOME/.local/bin:$PATH"' > $HOME/.bashrc
COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]