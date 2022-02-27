set -eu

test -n "${1}" || exit -1

test ! -d "${1}/vendor" || mkdir -p "${1}/vendor"
echo $(GEMFILE="${1}/Gemfile" bundle exec rails routes) | sed -E 's/ (GET|POST|PUT|PATCH|DELETE)/\n\1/g' > ${1}/vendor/tmp_rails_routes.cache
