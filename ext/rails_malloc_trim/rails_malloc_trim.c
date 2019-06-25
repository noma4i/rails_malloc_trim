#include "rails_malloc_trim.h"

VALUE rb_mMallocTrim;

static VALUE objtracer;

static VALUE has_malloc_trim(VALUE self) {
  #ifdef HAVE_MALLOC_TRIM
  return Qtrue;
  #else
  return Qfalse;
  #endif
}

static void malloc_trim_gc_end_handler(VALUE tpval, void *data) {
  #ifdef HAVE_MALLOC_TRIM
  malloc_trim(0);
  #endif
}

static VALUE enable_trimming(VALUE self) {
  #ifndef HAVE_MALLOC_TRIM
    return Qnil;
  #endif

  if (!RB_TEST(objtracer)) {
    objtracer = rb_tracepoint_new(0, RUBY_INTERNAL_EVENT_GC_END_MARK, malloc_trim_gc_end_handler, 0);
  }
  rb_tracepoint_enable(objtracer);
  return Qtrue;
}

void
Init_rails_malloc_trim(void)
{

  rb_mMallocTrim = rb_define_module("RailsMallocTrim");
  rb_define_singleton_method(rb_mMallocTrim, "trimming_possible?", has_malloc_trim, 0);
  rb_define_singleton_method(rb_mMallocTrim, "enable_trimming", enable_trimming, 0);
}
