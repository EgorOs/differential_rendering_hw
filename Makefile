.PHONY: *

ENV_NAME := diff_rendering
PKG_MANAGER := mamba  # or conda

create_env:
	$(PKG_MANAGER) env create -n $(ENV_NAME) --file environment.yml


activate_env:
    # May need to call `source activate base` first.
	$(PKG_MANAGER) activate $(ENV_NAME)


update_env:
	$(PKG_MANAGER) env update -n $(ENV_NAME) --file environment.yml


jupyterlab_start:
	# These lines ensure that CTRL+B can be used to jump to definitions in
	# code of installed modules.
	# Explained here: https://github.com/jupyter-lsp/jupyterlab-lsp/blob/39ee7d93f98d22e866bf65a80f1050d67d7cb504/README.md?plain=1#L175
	ln -s / .lsp_symlink || true  # Create if does not exist.
	jupyter nbextension enable --py --sys-prefix widgetsnbextension
	jupyter lab --ContentsManager.allow_hidden=True
