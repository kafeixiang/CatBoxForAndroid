if [ ! -z $ENV_NB4A ]; then
  export COMMIT_SING_BOX_EXTRA="e86b1f300045ecd3f20085602477b7c6c08087f9"
fi

if [ ! -z $ENV_SING_BOX_EXTRA ]; then
	source libs/get_source_env.sh
	# export COMMIT_SING_BOX="91495e813068294aae506fdd769437c41dd8d3a3"
fi
