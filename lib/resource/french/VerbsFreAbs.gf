--# -path=.:../romance:../abstract:../../prelude

-- Irregular verbs from Nancy, based on a list from Sylvain Pogodalla, 25/11/2004
-- Translated to GF by Aarne Ranta
-- added extracted subcat information 29/11

abstract VerbsFreAbs = {

cat 
  VN  ;
  VN2 ;

-- all verbs in classes with "er" and "ir" like "finir" are omitted

fun 
  abattreVN2 : VN2 ;
  absoudreVN2 : VN2 ;
  abstenirVN : VN ;
  abstraireVN2 : VN2 ;
  accourirVN : VN ;
  accro�treVN2 : VN2 ;
  accueillirVN2 : VN2 ;
  acqu�rirVN2 : VN2 ;
  adjoindreVN2 : VN2 ;
  admettreVN2 : VN2 ;
  advenirVN : VN ;
  allerVN : VN ;
  apercevoirVN2 : VN2 ;
  appara�treVN : VN ;
  appartenirVN2 : VN2 ;
  appendreVN2 : VN2 ;
  apprendreVN2 : VN2 ;
  assaillirVN2 : VN2 ;
  asseoirVN2 : VN2 ;
  astreindreVN2 : VN2 ;
  atteindreVN2 : VN2 ;
  attendreVN2 : VN2 ;
  avoirVN2 : VN2 ;
  battreVN2 : VN2 ;
  boireVN2 : VN2 ;
  bouillirVN2 : VN2 ;
  braireVN : VN ;
  ceindreVN2 : VN2 ;
  choirVN : VN ;
  circonscrireVN2 : VN2 ;
  circonvenirVN2 : VN2 ;
  cloreVN2 : VN2 ;
  combattreVN2 : VN2 ;
  commettreVN2 : VN2 ;
  compara�treVN2 : VN2 ;
  complaireVN2 : VN2 ;
  comprendreVN2 : VN2 ;
  compromettreVN2 : VN2 ;
  concevoirVN2 : VN2 ;
  conclureVN2 : VN2 ;
  concourirVN2 : VN2 ;
  condescendreVN2 : VN2 ;
  conduireVN2 : VN2 ;
  confireVN2 : VN2 ;
  confondreVN2 : VN2 ;
  conjoindreVN2 : VN2 ;
  conna�treVN2 : VN2 ;
  conqu�rirVN2 : VN2 ;
  consentirVN2 : VN2 ;
  construireVN2 : VN2 ;
  contenirVN2 : VN2 ;
  contraindreVN2 : VN2 ;
  contrebattreVN2 : VN2 ;
  contredireVN2 : VN2 ;
  contrefaireVN2 : VN2 ;
  contrevenirVN2 : VN2 ;
  convaincreVN2 : VN2 ;
  convenirVN2 : VN2 ;
  correspondreVN2 : VN2 ;
  corrompreVN2 : VN2 ;
  coudreVN2 : VN2 ;
  courirVN2 : VN2 ;
  couvrirVN2 : VN2 ;
  craindreVN2 : VN2 ;
  croireVN2 : VN2 ;
  cro�treVN : VN ;
  cueillirVN2 : VN2 ;
  cuireVN2 : VN2 ;
  d�battreVN2 : VN2 ;
  d�bouillirVN2 : VN2 ;
  d�cevoirVN2 : VN2 ;
  d�choirVN2 : VN2 ;
  d�cloreVN2 : VN2 ;
  d�commettreVN2 : VN2 ;
  d�confireVN2 : VN2 ;
  d�coudreVN2 : VN2 ;
  d�couvrirVN2 : VN2 ;
  d�crireVN2 : VN2 ;
  d�cro�treVN2 : VN2 ;
  d�cuireVN2 : VN2 ;
  d�duireVN2 : VN2 ;
  d�faillirVN : VN ;
  d�faireVN2 : VN2 ;
  d�fendreVN2 : VN2 ;
  d�mentirVN2 : VN2 ;
  d�mettreVN2 : VN2 ;
  d�mordreVN : VN ;
  d�partirVN2 : VN2 ;
  d�peindreVN2 : VN2 ;
  d�pendreVN2 : VN2 ;
  d�plaireVN : VN ;
  d�pourvoirVN2 : VN2 ;
  d�prendreVN2 : VN2 ;
  d�sapprendreVN2 : VN2 ;
  descendreVN2 : VN2 ;
  desservirVN2 : VN2 ;
  d�teindreVN2 : VN2 ;
  d�tendreVN2 : VN2 ;
  d�tenirVN2 : VN2 ;
  d�tordreVN2 : VN2 ;
  d�truireVN2 : VN2 ;
  devenirVN : VN ;
  d�v�tirVN2 : VN2 ;
  devoirVN2 : VN2 ;
  direVN2 : VN2 ;
  disconvenirVN2 : VN2 ;
  discourirVN2 : VN2 ;
  disjoindreVN2 : VN2 ;
  dispara�treVN2 : VN2 ;
  dissoudreVN2 : VN2 ;
  distendreVN2 : VN2 ;
  distordreVN2 : VN2 ;
  distraireVN2 : VN2 ;
  dormirVN2 : VN2 ;
  �battreVN : VN ;
  �choirVN2 : VN2 ;
  �cloreVN2 : VN2 ;
  �conduireVN2 : VN2 ;
  �crireVN2 : VN2 ;
  �lireVN2 : VN2 ;
  embatreVN2 : VN2 ;
  embattreVN2 : VN2 ;
  emboireVN : VN ;
  �mettreVN2 : VN2 ;
  �moudreVN2 : VN2 ;
  �mouvoirVN2 : VN2 ;
  empreindreVN2 : VN2 ;
  enceindreVN2 : VN2 ;
  encloreVN2 : VN2 ;
  encourirVN2 : VN2 ;
  endormirVN2 : VN2 ;
  enduireVN2 : VN2 ;
  enfreindreVN2 : VN2 ;
  enfuirVN : VN ;
  enjoindreVN2 : VN2 ;
  enqu�rirVN : VN ;
  entendreVN2 : VN2 ;
  entr'apercevoirVN : VN ;
  entrebattreVN : VN ;
  entre_d�truireVN : VN ;
  entre_ha�rVN : VN ;
  entremettreVN : VN ;
  entre_nuireVN : VN ;
  entreprendreVN2 : VN2 ;
  entretenirVN2 : VN2 ;
  entrevoirVN2 : VN2 ;
  entrouvrirVN2 : VN2 ;
  envoyerVN2 : VN2 ;
  �pandreVN2 : VN2 ;
  �perdreVN : VN ;
  �prendreVN : VN ;
  �quivaloirVN2 : VN2 ;
  �teindreVN2 : VN2 ;
  �tendreVN2 : VN2 ;
  �treindreVN2 : VN2 ;
  �treVN : VN ;
  exclureVN2 : VN2 ;
  extraireVN2 : VN2 ;
  faillirVN2 : VN2 ;
  faireVN2 : VN2 ;
  falloirVN : VN ;
  feindreVN2 : VN2 ;
  fendreVN2 : VN2 ;
  fondreVN2 : VN2 ;
  forfaireVN2 : VN2 ;
  foutreVN2 : VN2 ;
  frireVN2 : VN2 ;
  fuirVN2 : VN2 ;
  geindreVN2 : VN2 ;
  g�sirVN2 : VN2 ;
  ha�rVN2 : VN2 ;
  inclureVN2 : VN2 ;
  induireVN2 : VN2 ;
  inscrireVN2 : VN2 ;
  instruireVN2 : VN2 ;
  interdireVN2 : VN2 ;
  interrompreVN2 : VN2 ;
  intervenirVN : VN ;
  introduireVN2 : VN2 ;
  joindreVN2 : VN2 ;
  lireVN2 : VN2 ;
  luireVN : VN ;
  mainmettreVN2 : VN2 ;
  maintenirVN2 : VN2 ;
  m�conna�treVN2 : VN2 ;
  m�croireVN2 : VN2 ;
  m�direVN2 : VN2 ;
  mentirVN2 : VN2 ;
  m�prendreVN2 : VN2 ;
  messeoirVN2 : VN2 ;
  mettreVN2 : VN2 ;
  m�vendreVN2 : VN2 ;
  mordreVN2 : VN2 ;
  morfondreVN : VN ;
  moudreVN2 : VN2 ;
  mourirVN : VN ;
  mouvoirVN2 : VN2 ;
  na�treVN : VN ;
  nuireVN2 : VN2 ;
  obtenirVN2 : VN2 ;
  obvenirVN : VN ;
  occlureVN2 : VN2 ;
  offrirVN2 : VN2 ;
  oindreVN2 : VN2 ;
  omettreVN2 : VN2 ;
  ou�rVN2 : VN2 ;
  ouvrirVN2 : VN2 ;
  pa�treVN2 : VN2 ;
  pa�treVN : VN ;
  para�treVN : VN ;
  parcourirVN2 : VN2 ;
  parfondreVN2 : VN2 ;
  partirVN : VN ;
  parvenirVN : VN ;
  peindreVN2 : VN2 ;
  pendreVN2 : VN2 ;
  percevoirVN2 : VN2 ;
  perdreVN2 : VN2 ;
  permettreVN2 : VN2 ;
  plaindreVN2 : VN2 ;
  plaireVN2 : VN2 ;
  pleuvoirVN : VN ;
  poindreVN2 : VN2 ;
  pondreVN2 : VN2 ;
  pourfendreVN2 : VN2 ;
  poursuivreVN2 : VN2 ;
  pourvoirVN2 : VN2 ;
  pouvoirVN : VN ;
  pr�direVN2 : VN2 ;
  prendreVN2 : VN2 ;
  prescrireVN2 : VN2 ;
  pressentirVN2 : VN2 ;
  pr�tendreVN2 : VN2 ;
  pr�valoirVN2 : VN2 ;
  pr�venirVN2 : VN2 ;
  pr�voirVN2 : VN2 ;
  produireVN2 : VN2 ;
  promettreVN2 : VN2 ;
  promouvoirVN2 : VN2 ;
  proscrireVN2 : VN2 ;
  provenirVN : VN ;
  rabattreVN2 : VN2 ;
  raireVN2 : VN2 ;
  rapprendreVN2 : VN2 ;
  rasseoirVN2 : VN2 ;
  r�admettreVN2 : VN2 ;
  r�appara�treVN : VN ;
  r�apprendreVN2 : VN2 ;
  rebattreVN2 : VN2 ;
  recevoirVN2 : VN2 ;
  recompara�treVN2 : VN2 ;
  reconduireVN2 : VN2 ;
  reconna�treVN2 : VN2 ;
  reconqu�rirVN2 : VN2 ;
  reconstruireVN2 : VN2 ;
  recoudreVN2 : VN2 ;
  recourirVN2 : VN2 ;
  recouvrirVN2 : VN2 ;
  r�crireVN2 : VN2 ;
  recro�treVN2 : VN2 ;
  recueillirVN2 : VN2 ;
  recuireVN2 : VN2 ;
  red�couvrirVN2 : VN2 ;
  red�faireVN2 : VN2 ;
  redescendreVN2 : VN2 ;
  redevenirVN : VN ;
  redevoirVN2 : VN2 ;
  redireVN2 : VN2 ;
  r�duireVN2 : VN2 ;
  r��crireVN2 : VN2 ;
  r��lireVN2 : VN2 ;
  r�entendreVN2 : VN2 ;
  refaireVN2 : VN2 ;
  refendreVN2 : VN2 ;
  refondreVN2 : VN2 ;
  r�inscrireVN2 : VN2 ;
  r�introduireVN2 : VN2 ;
  rejoindreVN2 : VN2 ;
  relireVN2 : VN2 ;
  reluireVN2 : VN2 ;
  remettreVN2 : VN2 ;
  remordreVN2 : VN2 ;
  remoudreVN2 : VN2 ;
  rena�treVN2 : VN2 ;
  rendormirVN2 : VN2 ;
  rendreVN2 : VN2 ;
  rentraireVN2 : VN2 ;
  rentrouvrirVN2 : VN2 ;
  renvoyerVN2 : VN2 ;
  repa�treVN2 : VN2 ;
  r�pandreVN2 : VN2 ;
  repara�treVN : VN ;
  repartirVN : VN ;
  repeindreVN2 : VN2 ;
  rependreVN2 : VN2 ;
  repentirVN : VN ;
  reperdreVN2 : VN2 ;
  repleuvoirVN : VN ;
  r�pondreVN2 : VN2 ;
  reprendreVN2 : VN2 ;
  reproduireVN2 : VN2 ;
  requ�rirVN2 : VN2 ;
  r�soudreVN2 : VN2 ;
  ressentirVN2 : VN2 ;
  resservirVN2 : VN2 ;
  ressortirVN : VN ;
  ressouvenirVN : VN ;
  restreindreVN2 : VN2 ;
  reteindreVN2 : VN2 ;
  retendreVN2 : VN2 ;
  retenirVN2 : VN2 ;
  retondreVN2 : VN2 ;
  retordreVN2 : VN2 ;
  retraduireVN2 : VN2 ;
  retraireVN2 : VN2 ;
  retranscrireVN2 : VN2 ;
  retransmettreVN2 : VN2 ;
  r�treindreVN2 : VN2 ;
  revaloirVN2 : VN2 ;
  revendreVN2 : VN2 ;
  revenirVN : VN ;
  rev�tirVN2 : VN2 ;
  revivreVN2 : VN2 ;
  revoirVN2 : VN2 ;
  revouloirVN2 : VN2 ;
  rireVN2 : VN2 ;
  rompreVN2 : VN2 ;
  rouvrirVN2 : VN2 ;
  saillirVN2 : VN2 ;
  satisfaireVN2 : VN2 ;
  savoirVN2 : VN2 ;
  secourirVN2 : VN2 ;
  s�duireVN2 : VN2 ;
  sentirVN2 : VN2 ;
  seoirVN : VN ;
  servirVN2 : VN2 ;
  sortirVN : VN ;
  soubattreVN2 : VN2 ;
  souffrirVN2 : VN2 ;
  soumettreVN2 : VN2 ;
  sourireVN2 : VN2 ;
  souscrireVN2 : VN2 ;
  sous_entendreVN2 : VN2 ;
  sous_tendreVN2 : VN2 ;
  soustraireVN2 : VN2 ;
  soutenirVN2 : VN2 ;
  souvenirVN : VN ;
  subvenirVN2 : VN2 ;
  suffireVN2 : VN2 ;
  suivreVN2 : VN2 ;
  surfaireVN2 : VN2 ;
  surprendreVN2 : VN2 ;
  surproduireVN2 : VN2 ;
  surseoirVN2 : VN2 ;
  surtondreVN2 : VN2 ;
  survenirVN : VN ;
  survivreVN2 : VN2 ;
  suspendreVN2 : VN2 ;
  taireVN2 : VN2 ;
  teindreVN2 : VN2 ;
  tendreVN2 : VN2 ;
  tenirVN2 : VN2 ;
  tondreVN2 : VN2 ;
  tordreVN2 : VN2 ;
  traduireVN2 : VN2 ;
  traireVN2 : VN2 ;
  transcrireVN2 : VN2 ;
  transmettreVN2 : VN2 ;
  transpara�treVN : VN ;
  tr�fondreVN2 : VN2 ;
  tressaillirVN : VN ;
  vaincreVN2 : VN2 ;
  valoirVN2 : VN2 ;
  vendreVN2 : VN2 ;
  venirVN : VN ;
  v�tirVN2 : VN2 ;
  vivreVN2 : VN2 ;
  voirVN2 : VN2 ;
  vouloirVN2 : VN2 ;
}
