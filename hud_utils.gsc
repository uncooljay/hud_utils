canarchive()
{
    if( !isdefined( self.elementcount ) || self.elementcount < 0 )
        self.elementcount = 0;

    pool = 30;

    if( getdvar( "ui_zm_mapstartlocation" ) == "prison" )
        pool = 29;

    return self.elementcount < pool;
}

setpoint( point, x, y )
{
    if( !isdefined( point ) )
        point = "top_left;

    switch( point )
    {
        case "top_right":
            self.alignx = "user_right";
            self.aligny = "user_top";
            break;

        case "top_center":
            self.alignx = "user_center";
            self.aligny = "user_top";
            break;

        default:
            self.alignx = "user_left";
            self.aligny = "user_top";
            break;
    }

    self.horzalign = "user_center";
    self.vertalign = "user_top";

    if( !isdefined( x ) )
        x = 0;

    if( !isdefined( y ) )
        y = 0;

    self.x = x;
    self.y = y;
}

createtext( text, font, fontscale, point, x, y, color, sort, alpha )
{
    element = newclienthudelem( self );
    element.archived = self canarchive();
    element.font = font;
    element.fontscale = fontscale;
    element.width = 0;
    element.height = int( level.fontheight * element.fontscale );
    element.color = color;
    element.sort = sort;
    element.alpha = alpha;
    element.hidewheninmenu = true;
    element.hidewheninscope = true;

    element settext( text );
    element setpoint( point, x, y );

    self.elementcount++;

    return element;
}

createicon( shader, width, height, point, x, y, color, sort, alpha )
{
    element = newclienthudelem( self );
    element.archived = self canarchive();
    element.width = width;
    element.height = height;
    element.color = color;
    element.sort = sort;
    element.alpha = alpha;
    element.hidewheninmenu = true;
    element.hidewheninscope = true;

    element setshader( shader, width, height );
    element setpoint( point, x, y );

    self.elementcount++;

    return element;
}

destroyelement( element )
{
    if( !isdefined( element ) )
        return;

    element destroy();
    self.elementcount--;
}
