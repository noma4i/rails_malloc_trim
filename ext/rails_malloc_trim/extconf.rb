require 'mkmf'

find_header('malloc.h')
find_header('ruby/debug.h')
have_func('malloc_trim')

create_makefile('rails_malloc_trim/rails_malloc_trim')
