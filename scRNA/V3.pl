#!/usr/bin/perl
use strict;
use warnings;

use CQS::ClassFactory;
use CQS::FileUtils;
use Data::Dumper;
use Pipeline::scRNASeq;

my $def = {
  task_name => "AG3364",

  email      => "quanhu.sheng.1\@vumc.org",
  target_dir => create_directory_or_die("Z:/shengq1/scRNA_demo/V03"),

  #docker_command => "singularity exec /scratch/cqs/softwares/singularity/cqs-rnaseq.simg ",

  files => {
    "AG1" => ["Z:/shengq1/scRNA/alexander_gelbard/data/3364/Count/3364-AG-1/filtered_feature_bc_matrix"],
    "AG2" => ["Z:/shengq1/scRNA/alexander_gelbard/data/3364/Count/3364-AG-2/filtered_feature_bc_matrix"],
    "AG3" => ["Z:/shengq1/scRNA/alexander_gelbard/data/3364/Count/3364-AG-3/filtered_feature_bc_matrix"],
  },

  seurat_additional_rmd => "",
  webgestalt_organism   => "hsapiens",

  nFeature_cutoff_min => 200,
  nFeature_cutoff_max => 5000,
  nCount_cutoff       => 500,
  mt_cutoff           => 20,
  Mtpattern           => "^MT-|^Mt-|^mt-",
  rRNApattern         => "^Rp[sl][[:digit:]]|^RP[SL][[:digit:]]",
  Remove_Mt_rRNA      => "FALSE",
  resolution          => 0.8,
  pca_dims            => 20,
  species             => "Hs",
  
  markers_file => "Z:/shengq1/scRNA/PanglaoDB_markers_21_Oct_2019.tsv",
  
  #different to V1
  Remove_Mt_rRNA      => "TRUE", 
  resolution          => 0.5,
  perform_scRNABatchQC => 0,
  "Details.Rmd"    => "Z:/shengq1/scRNA_demo/Details.Rmd", 
};

my $config = performScRNASeq( $def, 1 );

#performConfig($config);

1;
