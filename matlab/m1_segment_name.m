function segment_name = m1_segment_name(ID,nsession,nsegment)

segment_name = m1_basename(ID,['session_' num2str(nsession) '_segment_' num2str(nsegment)]);