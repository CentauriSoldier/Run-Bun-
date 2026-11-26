--[[!
@fqxn Run Bun!.Alpha.DrawBack
@desc Draws the deck-specific back beneath the shared border.
]]
return function(sObject, D, hDC)
    local nWidth        = _nCardWidth;
    local nHeight       = _nCardHeight;
    local pComponents   = _pCardSet.."/Images/Components";
    local pArt          = pComponents.."/Back ".._tRow.Deck..".png";

    --draw the full-bleed base, deck artwork and shared border
    Forge.DrawRectangle(0, 0, nWidth, nHeight, 0x000000FF);
    Forge.DrawImage(pArt, 0, 0, nWidth, nHeight);
    Forge.DrawImage(pComponents.."/Back Border.png", 0, 0, nWidth, nHeight);
end
