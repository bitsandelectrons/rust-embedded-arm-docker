FROM rust:1.75-slim-bookworm as rust

FROM bitsandelectrons/arm-none-eabi

ENV RUSTUP_HOME=/usr/local/rustup \
    CARGO_HOME=/usr/local/cargo \
    PATH=/usr/local/cargo/bin:$PATH

COPY --from=rust /usr/local/rustup /usr/local/rustup
COPY --from=rust /usr/local/cargo /usr/local/cargo

RUN rustup component add clippy; \
    rustup target list | grep -E '^(arm|thumb).*none' | xargs rustup target install
