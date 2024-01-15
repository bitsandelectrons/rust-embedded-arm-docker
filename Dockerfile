FROM bitsandelectrons/arm-none-eabi

RUN pacman -S --noconfirm \
	rustup \
	clang \
	&& rm -rf /var/cache/pacman \
	&& rustup update stable \
	&& rustup target list | grep -E '^(arm|thumb).*none' | xargs rustup target install
