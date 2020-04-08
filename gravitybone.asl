state("gravitybone", "KMQuake2")
{
   //dichiarazione dei puntatori
   string10 state_name: 0x003E094, 0x11C; 
   int friendly_mutton_chop : 0x0019504, 0x75C;
   int birds : 0x00221AC, 0x10C;
   int song : 0x00BB220, 0x6BC;
  
   //98 blank.cin
   //70 parlo1 or 0 if reset
   //98 b01.cin or 0 if reset
   //66 bad

}
init 
{
   vars.split = 0;

}
update
{
    if ( current.friendly_mutton_chop == 0  );
    {
        vars.split = 0;
    }

}
startup 
{

    settings.Add("option1", true ,"Friendly Mutton Chop Finish Split");
    settings.Add("option2", true ,"Bird's Photo Split");
    settings.Add("option3", true ,"1st Bird's Photo Split","option2");
    settings.Add("option4", true ,"2nd Bird's Photo Split","option2");   
    settings.Add("option5", true ,"3rd Bird's Photo Split","option2");
    settings.Add("option6", true ,"4th Bird's Photo Split","option2");
    settings.Add("option7", true ,"5th Bird's Photo Split","option2");
    settings.Add("option8", true ,"Elevator Split");

    settings.SetToolTip("option1", "abilita xddddd" );
   
   //works correctly if you start a new game
}
start 
{
    if ( current.friendly_mutton_chop != 0 && old.friendly_mutton_chop == 0 && current.state_name != "hof1"   )
    {
        vars.split++;
        return true;
    }

}


split
{
    if (settings ["option1"])
    {
        if( current.state_name == "b01.cin" && old.state_name == "parlo1"  )    //friendly muttond chop's end split
        {
            vars.split+=1;
            return true;
        }
    }
    if (settings ["option3"] && settings ["option2"] )
    {
        if( current.birds == 327681 && old.birds == 0 )  //bird 1 
        {
            vars.split+=1;
            return true;
        }
    }
    if (settings ["option4"] && settings ["option2"])
    {
        if( current.birds == 327682 && old.birds == 327681 )   //bird 2
        {
            vars.split+=1;
            return true;
        }
    }
    if (settings ["option5"] && settings ["option2"])
    {
        if( current.birds == 327683 && old.birds == 327682 )   //bird 3
        {
            vars.split+=1;
            return true;
        }
    }
    if (settings ["option6"] && settings ["option2"])
    {
        if( current.birds == 327684 && old.birds == 327683 )   //bird 4
        {
            vars.split+=1;
            return true;
        }
    }
    if (settings ["option7"] && settings ["option2"])
    {
        if( current.birds == 327685 && old.birds == 327684 )   //bird 5
        {
            vars.split+=1;
            return true;
        }
    }
      
    if (settings ["option8"] )
    {
        if( current.song == 1919037283  && old.song == 0  && current.state_name == "hof1" )    //elevator split
        {
            vars.split+=1;
            return true;
        }
    }
    if( current.song == 0   && old.song == 1919037283  && current.state_name == "hof1" )    //ending split
        {
            vars.split+=1;
            return true;
        }
    
}



reset
{
    if ( current.friendly_mutton_chop == 0 && old.friendly_mutton_chop != 0 && current.state_name != "b01.cin" && current.state_name != "victory.p" )
    {

        vars.split=0;
        return true;
    }


}
