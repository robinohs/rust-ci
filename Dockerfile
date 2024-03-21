FROM rust:slim-bookworm

# Update container
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y build-essential curl make libssl-dev pkg-config zip libclang-dev wget tar graphviz

# Rust Toolchain
# RUN rustup toolchain install "stable"
# RUN rustup toolchain install "beta"
# RUN rustup toolchain install "nightly"
# RUN rustup default "stable"

# Rust Tools
RUN rustup component add clippy
RUN rustup component add rustfmt

# Cargo binstall
RUN curl -L --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/cargo-bins/cargo-binstall/main/install-from-binstall-release.sh | bash

# Cargo binaries
RUN cargo binstall --no-confirm cargo-spellcheck
RUN cargo binstall --no-confirm cargo-about
RUN cargo binstall --no-confirm cargo-outdated
RUN cargo binstall --no-confirm cargo-udeps
RUN cargo binstall --no-confirm cargo-pants
RUN cargo binstall --no-confirm cargo-audit
RUN cargo binstall --no-confirm cargo-tarpaulin

# Rustbook
RUN cargo binstall --no-confirm mdbook
RUN cargo binstall --no-confirm mdbook-mermaid
RUN cargo binstall --no-confirm mdbook-graphviz
RUN cargo binstall --no-confirm mdbook-linkcheck
RUN cargo binstall --no-confirm mdbook-admonish
RUN cargo binstall --no-confirm mdbook-toc
RUN cargo binstall --no-confirm mdbook-katex

# Clear caches / Minimize image size
RUN cargo binstall --no-confirm du-dust
RUN mv $CARGO_HOME/bin/* /bin
RUN rm -rfv $CARGO_HOME
RUN apt-get clean

# ENTRYPOINT [ "/bin/bash", "-l", "-c" ]