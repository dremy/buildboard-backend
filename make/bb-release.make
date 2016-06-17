api = 2
core = 7.x

defaults[projects][subdir] = contrib

; Basic modules
projects[entity][version] = 1.6
projects[libraries][version] = 2.2
projects[ctools][version] = 1.9

; Administration
projects[admin_menu][version] = 3.0-rc5
projects[module_filter][version] = 2.0

; Taxonomy
projects[taxonomy_manager][version] = 1.0

; Group
projects[group][version] = 1.0-beta6

; Fields
projects[entityreference][version] = 1.1
projects[geofield][version] = 2.3
projects[geophp][version] = 1.7
projects[geophp][version] = 1.3
projects[mvf][version] = 1.0-beta3
projects[multifield][version] = 1.0-alpha1
projects[auto_nodetitle][version] = 1.0
projects[units][version] = 1.0-rc1
projects[unitsapi][version] = 1.0
projects[currency][version] = 2.6
projects[addressfield][version] = 1.2
projects[field_group][version] = 1.5
projects[email][version] = 1.3
; Fixes: Add email verification field
projects[email][patch][] = https://www.drupal.org/files/issues/email-verification_field-234682-8.patch
projects[link][version] = 1.3
projects[telephone][version] = 1.0-alpha1
projects[name][version] = 1.10
projects[computed_field][version] = 1.1
projects[field_collection][version] = 1.0-beta11
projects[field_collection_table][version] = 1.0-beta3

; Add compatibility with Features
projects[auto_nodetitle][patch][] = https://www.drupal.org/files/issues/auto_nodetitle-881170-50.patch
projects[auto_nodetitle][patch][] = https://www.drupal.org/files/issues/auto_nodetitle-specialchars-fix-707484-43.patch
projects[auto_nodetitle][patch][] = https://www.drupal.org/files/issues/auto_nodetitle-custom-date-tokens-1197278-49.patch

; Views
projects[views][version] = 3.11
projects[views_data_export][version] = 3.0-beta8
projects[views_datasource][version] = 1.0-alpha2

; Angular
projects[angular_drupal][version] = 1.1

; Regional Settings
; -- Time
projects[date][version] = 2.8
; Fixes: "Fatal Error" - Cannot create references to/from string offsets nor overloaded objects
projects[date][patch][2449261] = https://www.drupal.org/files/issues/date-cannot_create_references_to_from_string_offsets-2449261-1.patch

; Services
projects[services][version] = 3.13
; Fixes: Services create multivalued field nodes
projects[services][patch][] = https://www.drupal.org/files/issues/multivalue_fields_fix-2224803-35.patch
projects[services_entity][version] = 2.0-alpha8
projects[services_addressfield][version] = 1.1
projects[cors][version] = 1.3

; Services library Requirement
libraries[services][download][type] = git
libraries[services][download][branch] = master
libraries[services][download][url] = https://github.com/mustangostang/spyc.git
libraries[services][directory_name] = spyc
libraries[services][destination] = libraries
