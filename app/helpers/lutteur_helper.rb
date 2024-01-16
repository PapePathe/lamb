module LutteurHelper
  def pourcentage_victoires(lutteur)
   ((lutteur.victoires.count * 100) / lutteur.combats.count).round   if lutteur.combats.count > 0
  end

  def pourcentage_defaites(lutteur)
    ((lutteur.defaites.count * 100) / lutteur.combats.count).round   if lutteur.combats.count > 0
  end

  def pourcentage_match_nuls(lutteur)
    ((lutteur.match_nuls.count * 100) / lutteur.combats.count).round   if lutteur.combats.count > 0
  end
end
