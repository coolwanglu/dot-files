const Gio = imports.gi.Gio;
const GLib = imports.gi.GLib;
const Main = imports.ui.main;

try{
  /*
   * Add a new path for the Run Dialog
   */
    let cur_p = GLib.getenv('PATH');
    let new_p = '/home/wl/bin';
    if((':'+cur_p+':').search(':'+new_p+':') == -1) {
        GLib.setenv('PATH', new_p+':'+cur_p, true);
    }
}catch(e){}

try{
  /*
   * Set clock format
   */
  let dm = Main.panel.statusArea.dateMenu; 
  dm._clock.connect('notify::clock', function(){
    dm._clockDisplay.set_text((new Date()).toLocaleFormat('%a %F %T'));
  });
}catch(e){}

