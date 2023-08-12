.PHONY: *

ENV_NAME := diff_rendering

create_env:
	conda env create -n $(ENV_NAME) --file environment.yml


activate_env:
    # May need to call `source activate base` first.
	conda activate $(ENV_NAME)


update_env:
	conda env update -n $(ENV_NAME) --file environment.yml

