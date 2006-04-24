#!/usr/bin/gawk -f

/-----BEGIN PGP SIGNED MESSAGE-----/ {
  if (first_line_seen) 
    {
      bogosity = 1;
      exit;
    }
  else
    {
      print $0 | gpg_command;
      first_line_seen = 1;
    }
  next;
}


/-----END PGP SIGNATURE-----/ {
  if (!first_line_seen)
    {
      bogosity = 1;
      exit;
    }
  else
    {
      print $0 | gpg_command;
      last_line_seen = 1;
    }
  next;
}


{
  if (!first_line_seen || last_line_seen)
    {
      bogosity = 1;
      exit;
    }
  else
    {
      print $0 | gpg_command;
    }
  next;
}

END {
 if (bogosity || close(gpg_command))
   {
     exit 1;
   }
 else
   {
     exit 0;
   }
}

# tag: Tom Lord Mon Jan 26 19:49:35 2004 (tla/=gpg-check.awk)
#
