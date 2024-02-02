FROM rust:latest

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

