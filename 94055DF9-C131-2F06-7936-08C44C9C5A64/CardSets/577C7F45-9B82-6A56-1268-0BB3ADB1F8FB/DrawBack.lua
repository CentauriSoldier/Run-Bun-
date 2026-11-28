--[[!
@fqxn Run Bun!.Alpha.DrawBack
@desc Draws the intact approved deck back without cropping or a second border.
]]
return function(sObject, D, hDC)
    local nWidth        = _nCardWidth;
    local nHeight       = _nCardHeight;
    local sDeck         = _tRow.Deck;
    local pComponents   = _pCardSet.."/Images/Components";

    --Choice uses the user-composed symmetric interior and its separate frame
    if (sDeck == "Choice") then
        Forge.DrawRectangle(0, 0, nWidth, nHeight, 0x000000FF);
        Forge.DrawImage(pComponents.."/Back Choice.png", 0, 0, nWidth, nHeight);
        Forge.DrawImage(pComponents.."/Back Border Choice.png", 0, 0, nWidth, nHeight);
        return;
    end

    --Almanac and Clockwork keep their interiors and branded border as separate layers
    if (sDeck == "Almanac" or sDeck == "Clockwork") then
        Forge.DrawRectangle(0, 0, nWidth, nHeight, 0x000000FF);
        Forge.DrawImage(pComponents.."/Back "..sDeck..".png", 0, 0, nWidth, nHeight);
        Forge.DrawImage(pComponents.."/Back Border.png", 0, 0, nWidth, nHeight);
        return;
    end

    local pArt          = pComponents.."/Resize/"..sDeck.." Flush Source/Back "..sDeck..".png";
    local nSourceWidth  = sDeck == "Survival" and 1074 or 1075;
    local nSourceHeight = sDeck == "Dog" and 1463 or 1464;
    local nScale        = math.min(nWidth / nSourceWidth, nHeight / nSourceHeight);
    local nArtWidth     = nSourceWidth * nScale;
    local nArtHeight    = nSourceHeight * nScale;

    --the approved source already includes its border; fit the whole image uniformly
    Forge.DrawRectangle(0, 0, nWidth, nHeight, 0x000000FF);
    Forge.DrawImage(pArt, (nWidth - nArtWidth) / 2, (nHeight - nArtHeight) / 2, nArtWidth, nArtHeight);
end
