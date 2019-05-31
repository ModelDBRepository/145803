function [GGG TTT] = algorithmeR(TTT , PPP, Npoints,limita,limitb)


%%   import data   

                            tta =TTT.tta; 
                            sso = TTT.vva; 
      

%%   extraction of preconductances

                            dt = tta(2,1) - tta(1,1);
                            x = sso(2,1)-sso(1,1); y=sso(1,1);
                             if (x/y >0)
                            aa(1) = (1/dt)*log(x/y );
                             else
                            aa(1)=real((1/dt)*log(x/y ));
                             end
                            x = exp(aa(1)*dt) -1;
                            bb(1) = sso(1,1)*aa(1)/x;
                      
                            
                            for n=2:length(sso)-1
                             
                           x = sso(n+1,1)-sso(n,1); y=sso(n,1)-sso(n-1,1);
                           
                                           if ((x/y >0)&& (abs(y)>0) )
                                             aa(n) = (1/dt)* ( log(x/y) );
                                           else
                                            aa(n)=aa(n-1);
                                           end
                           
                            x = exp(aa(n)*dt)-1;                                    
                            y = - sso(n-1,1)* exp(aa(n)*dt);
                            bb(n) = (sso(n,1)+y)*aa(n)/x;
                            tto(n) = tta(n);
                            end
                            
                            %definitions symbolics (extraction of singularities)
                            ttEx = tto; 
                            ggs1ExSing = aa;
                            ggs2ExSing = bb;
                            
%% algorithm to remove the singularities
           
                             aao =aa; bbo=bb; 
                             
                             % first corrections (remove the singularities (complex number))
                             
                             for n=5:length(aao)
                                 aao(n) =aao(n);
                            bbo(n) = bbo(n);
                            if (imag(aao(n)) == 0)
                             aao(n) = aao(n);
                             bbo(n) = bbo(n);
                            else
                              aao(n) = aao(n-1);
                              bbo(n) = bbo(n-1);
                            end
                              
                             end
           

                             % second  corrections (remove the singularities  (numerics + heaviside))
                             for n=6:length(aao)-1
                              
                             if (  ( abs( (aao(n)-aao(n-1))/aao(n-1) ) > limita ))   
%                                xx = mean(-abs(aao(n-20:n-1)));
%                                aao(n) = xx; %experimentals
                                aao(n) = aao(n-1);

                               end
                               
                               if (  ( abs( (bbo(n)-bbo(n-1))/bbo(n-1) ) > limitb ) )
%                               xx = mean(-abs(bbo(1:n-1)));
%                               bbo(n) =xx;  %experimentals
                                  bbo(n) = bbo(n-1);
                              end
                                                    
                             end
                             
                            % definitions symbolics (extraction without singularities )
                             ggs1Ex =aao;  ggs2Ex =bbo;

%%  extraction of conductances

 Ee = PPP.Ee;  Ei=PPP.Ei;       El = PPP.El;     gl=PPP.gl;    cap=PPP.cap;

                  for n=1:length(aao)
                      ggeEx(n) = (cap*bbo(n) +Ei*(cap*aao(n)+gl)-gl*El)/(Ee-Ei);
                      ggiEx(n) = -(cap*aao(n)+ggeEx(n)+gl);
                  end
                  
%%  export data        


                   
               % extraction of  preconductances + singularities          
           GGG.ggs1ExSing = ggs1ExSing;   GGG.ggs2ExSing=ggs2ExSing;                               
               % extraction of conductances   
           GGG.ggeEx = ggeEx; GGG.ggiEx=ggiEx; 
               % extraction of preconductances                       
           GGG.ggs1Ex = ggs1Ex ;   GGG.ggs2Ex=ggs2Ex ;                    
                 % time
            GGG.ttEx=ttEx;  
                      
                      %preconductances originals
             GGG.ggs1=TTT.ggs1;  GGG.ggs2 = TTT.ggs2;  
                      % conductances originals     
             GGG.gge=TTT.gge;  GGG.ggi = TTT.ggi;                   
                      % time  
              GGG.tt = TTT.tt;     

                       

                     
                     