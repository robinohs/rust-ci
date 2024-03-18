FROM rust:latest

# Update container
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y build-essential curl make libssl-dev pkg-config zip


# Rust Toolchain
RUN rustup toolchain install "stable"
RUN rustup toolchain install "beta"
RUN rustup toolchain install "nightly"
RUN rustup default "stable"

# Rust Tools
RUN rustup component add clippy
RUN rustup component add rustfmt

# Cargo binaries
RUN cargo install cargo-about
RUN cargo install cargo-outdated
RUN cargo install cargo-udeps
RUN cargo install cargo-pants
RUN cargo install cargo-audit
RUN cargo install cargo-tarpaulin

# Rustbook
RUN  cargo install mdbook --no-default-features --features search --vers "^0.4" --locked
RUN  cargo install mdbook-linkcheck
RUN  cargo install mdbook-admonish
RUN  cargo install mdbook-toc
RUN  cargo install mdbook-katex
