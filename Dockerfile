FROM rust:latest

# Update container
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y build-essential curl make libssl-dev pkg-config zip libclang-dev wget tar graphviz


# Rust Toolchain
RUN rustup toolchain install "stable"
RUN rustup toolchain install "beta"
RUN rustup toolchain install "nightly"
RUN rustup default "stable"

# Rust Tools
RUN rustup component add clippy
RUN rustup component add rustfmt

# Cargo binaries
RUN cargo install --locked cargo-spellcheck
RUN cargo install --locked cargo-about
RUN cargo install --locked cargo-outdated
RUN cargo install --locked cargo-udeps
RUN cargo install --locked cargo-pants
RUN cargo install --locked cargo-audit
RUN cargo install --locked cargo-tarpaulin

# Rustbook
RUN cargo install --locked mdbook --vers "^0.4"
RUN cargo install --locked mdbook-mermaid --vers "^0.13"
RUN cargo install --locked mdbook-graphviz --vers "^0.1"
RUN cargo install --locked mdbook-quiz --vers "^0.3"
RUN cargo install --locked mdbook-linkcheck --vers "^0.7"
RUN cargo install --locked mdbook-admonish --vers "^1.15"
RUN cargo install --locked mdbook-toc --vers "^0.14"
RUN cargo install --locked mdbook-katex --vers "^0.7"
