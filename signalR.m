
%  generates the oversampled voltage from known conductances



function [GGG PPP] = signalR(oversampling,gge,ggi,tt,PPP)

                                                                           
                   % transformation of conductances (first step)
                 for n=1:1:length(tt)-1    
                       for m=oversampling-1:-1:0
                            ggea(oversampling*n-m)=gge(n); 
                            ggia(oversampling*n-m)=ggi(n); 
                            tta(oversampling*n-m) = tt(n) + (oversampling-m-1)*(tt(n+1)-tt(n))/oversampling;
                       end
                 end
                 
                 % compute preconductances : (second step)

                   condinitiale =  PPP.Initial; %condition initial of tension
                   
                   % computes preconductances normals               
                  ggl(1,1:length(ggi)) = PPP.gl;
                  ggs1 = -(gge+ggi+ggl)/PPP.cap; 
                  ggs2 = (PPP.Ee*gge +PPP.Ei*ggi +PPP.El*ggl)/PPP.cap;
                  
                   % compute voltage normal             
                 [tt vv] = eqdifferentielleR(tt,ggs1,ggs2,condinitiale);
                   
                   % computes preconductances for oversampled voltage
                  ggla(1,1:length(ggia)) = PPP.gl;
                  ggs1a = -(ggea+ggia+ggla)/PPP.cap; 
                  ggs2a = (PPP.Ee*ggea +PPP.Ei*ggia +PPP.El*ggla)/PPP.cap;
                   
                   % compute oversampled voltage
                 [tta vva] = eqdifferentielleR(tta,ggs1a,ggs2a,condinitiale);
    

                 % structure
                   GGG.tt=tt; GGG.vv= vv;  % voltage, normal
                   GGG.tta=tta; GGG.vva= vva;  % voltage, oversampled
                   GGG.gge=gge; GGG.ggi=ggi;  % inhibitors and excitators, originals
                   GGG.ggea=ggea; GGG.ggia=ggia;  % inhibitors and excitators, with oversampling
                   GGG.ggs1=ggs1; GGG.ggs2=ggs2; % preconductances, normal
                   GGG.ggs1a=ggs1a; GGG.ggs2a=ggs2a; % preconductances, oversampled
             
   
                   
                   
                   
                   
           
                  



