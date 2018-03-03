#include "cacheblock.h"

uint32_t Cache::Block::get_address() const {
  // TODO
  uint32_t offset = _cache_config.get_num_block_offset_bits();


  return (_tag<<(_cache_config.get_num_index_bits()+offset))|(_index<<offset);
}
