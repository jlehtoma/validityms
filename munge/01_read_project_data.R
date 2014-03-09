# Latest project, basically the runs done by Antti in septemeber re-run in
# Viikki

library(zonator)

# Set the data source
if (.Platform$OS.type == "unix") {
  root <- "/home/jlehtoma/Dropbox/Collaborations/validity_ms/"
} else {
  root <- "C:\\Data\\ESMK\\analyysi"
}


# Project and variants ----------------------------------------------------

project.esmk <- create_zproject(root=root)

# Since the only difference in variants 14-20 and 21-27 is the groups used,
# use 14-20 and do the regrouping manually. Variants are:
#
# 1 = 14_60_5kp_abf
# 2 = 15_60_5kp_abf_pe
# 3 = 16_60_5kp_abf_pe_w
# 4 = 17_60_5kp_abf_pe_w_cmat
# 5 = 18_60_5kp_abf_pe_w_cmat_cmete
# 6 = 19_60_5kp_abf_pe_w_cmat_cmete_cres
# 7 = 20_60_5kp_abf_pe_w_cmat_cmete_cres_mask
#
variant.1 = get_variant(project.esmk, 1)
variant.2 = get_variant(project.esmk, 2)
variant.3 = get_variant(project.esmk, 3)
variant.4 = get_variant(project.esmk, 4)
variant.5 = get_variant(project.esmk, 5)
variant.6 = get_variant(project.esmk, 6)
variant.7 = get_variant(project.esmk, 7)

# Re-grouping -------------------------------------------------------------


