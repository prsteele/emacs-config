(use-package neuron-mode
  :bind
  (("C-c C-z" . neuron-new-zettel)
   ("C-c C-e" . neuron-edit-zettel)
   (:map neuron-mode-map
         ("C-c t" . neuron-toggle-connection-type)
         ("C-c C-u" . neuron-edit-uplink)))
  :custom
  (neuron-default-zettelkasten-directory (expand-file-name "~/zettelkasten")))
