{
    // A source by Rafsun Masud Prince
    // Editable Usable NoCredit
    
    _x = argument0 - 2; // X Value
    _y = argument1 - 2; // Y Value
    _w = argument2 + 2; // Height
    _h = argument3 + 2; // Width
    
    if (mouse_x >= _x and mouse_x <= _x + _w) and (mouse_y >= _y and mouse_y <= _y + _h)
        return true;
    else
        return false;
}
