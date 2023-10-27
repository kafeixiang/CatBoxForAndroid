if [ ! -z $ENV_NB4A ]; then
  export COMMIT_SING_BOX_EXTRA="9fa3e2ab4ffda7e8514a61e1dbb1d8d99077046b"
fi

if [ ! -z $ENV_SING_BOX_EXTRA ]; then
  source libs/get_source_env.sh
  # export COMMIT_SING_BOX="91495e813068294aae506fdd769437c41dd8d3a3"
fi
